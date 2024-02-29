defmodule LambcastWeb.LambcastComponents do
  use Phoenix.Component

  @doc """
  Renders a messages block.

  ## Examples

    <%= for message <- @messages do %>
      <.lambcast_msg>
        <:msg timestamp={message["data"]["timestamp"]} >
          <%= message["data"]["castAddBody"]["text"] %>
        </:msg>
      </.lambcast_msg>
    <% end %>
  """

  slot :msg, required: true do
    attr :timestamp, :string, required: true
  end

  def lambcast_msg(assigns) do
    ~H"""
    <ol class="relative border-s dark:border-violet-700">
      <li :for={msg <- @msg} class="mb-10 ms-4">
        <div class="absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -start-1.5 border border-white dark:border-gray-900 dark:bg-gray-700">
        </div>
        <time class="mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500">
          <%= msg.timestamp %>
        </time>
        <p class="max-w-xl text-base font-normal dark:text-white"><%= render_slot(msg) %></p>

        <div class="mt-3 dark:text-gray-400 flex flex-row gap-3">
          <button class="hover:text-red-500">
            <.icon name="hero-heart" />
          </button>
          <button class="hover:text-purple-500">
            <.icon name="hero-arrow-path" />
          </button>
          <button class="hover:text-blue-500">
            <.icon name="hero-chat-bubble-oval-left" />
          </button>
        </div>
      </li>
    </ol>
    """
  end

  @doc """
  Renders a round button.

  ## Examples

    <.lambcast_button type="submit">
      <.icon name="hero-magnifying-glass"/>
    </.lambcast_button>
  """
  attr :type, :string, default: nil
  attr :shape, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block, required: true

  def lambcast_button(%{shape: "round"} = assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "phx-submit-loading:opacity-75 rounded-full bg-violet-900 hover:bg-violet-700 py-3 px-4",
        "text-medium font-semibold leading-6 text-white active:text-white/80",
        "absolute end-2 bottom-2",
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  def lambcast_button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "phx-submit-loading:opacity-75 rounded-lg bg-violet-900 hover:bg-violet-700 py-3 px-4",
        "text-medium font-semibold leading-6 text-white active:text-white/80",
        "absolute end-2 bottom-2",
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  @doc """
  Renders a round input with label and error messages.

  A `Phoenix.HTML.FormField` may be passed as argument,
  which is used to retrieve the input name, id, and values.
  Otherwise all attributes may be passed explicitly.

  ## Examples
    <.lambcast_roundinput type="text" class="px-28 py-3.5" field={f[:search]} placeholder="Search Username" required />
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string, default: nil
  attr :value, :any

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week)

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"

  attr :rest, :global,
    include: ~w(accept autocomplete capture cols disabled form list max maxlength min minlength
                multiple pattern placeholder readonly required rows size step)

  attr :class, :string, default: nil

  slot :inner_block

  def lambcast_round_input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    assigns
    |> assign(field: nil, id: assigns.id || field.id)
    |> assign(:errors, Enum.map(field.errors, &translate_error(&1)))
    |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
    |> assign_new(:value, fn -> field.value end)
    |> lambcast_round_input()
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def lambcast_round_input(assigns) do
    ~H"""
    <div phx-feedback-for={@name}>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={[
          "flex rounded-full text-left text-violet-900 focus:ring-5",
          "phx-no-feedback:border-violet-300 phx-no-feedback:focus:border-violet-400",
          "text-xl antialiased font-semibold",
          @class,
          @errors == [] && "border-4 border-violet-300 focus:border-violet-400",
          @errors != [] && "border-4 border-rose-400 focus:border-rose-400"
        ]}
        {@rest}
      />
      <.error :for={msg <- @errors}><%= msg %></.error>
    </div>
    """
  end

  # Generates a generic error message.
  slot :inner_block, required: true

  defp error(assigns) do
    ~H"""
    <p class="mt-3 flex gap-3 text-sm leading-6 text-rose-600 phx-no-feedback:hidden">
      <.icon name="hero-exclamation-circle-mini" class="mt-0.5 h-5 w-5 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end

  # Renders a [Heroicon](https://heroicons.com) .
  attr :name, :string, required: true
  attr :class, :string, default: nil

  defp icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end

  defp translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # However the error messages in our forms and APIs are generated
    # dynamically, so we need to translate them by calling Gettext
    # with our gettext backend as first argument. Translations are
    # available in the errors.po file (as we use the "errors" domain).
    if count = opts[:count] do
      Gettext.dngettext(LambcastWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(LambcastWeb.Gettext, "errors", msg, opts)
    end
  end
end
