defmodule LambcastWeb.PageHTML do
  use LambcastWeb, :html

  # embed_templates "page_html/*"

  def home(assigns) do
    ~H"""
    <div>
      <p class>User: <%= @user["name"] %></p>
      <p class>FID: <%= @user["fid"] %></p>
    </div>
    <table>
      <thead>
        <tr>
          <th>Message</th>
          <th>Timestamp</th>
          <th>Links</th>
        </tr>
      </thead>
      <tbody id="messages">
        <%= for msg <- @messages do %>
          <tr>
            <%= if !msg["data"]["castAddBody"]["parentCastId"]["fid"] do %>
              <td class="border"><%= msg["data"]["castAddBody"]["text"] %></td>
              <td class="border"><%= msg["data"]["timestamp"] %></td>
              <td class="border">
                <div>
                  <%= if msg["data"]["castAddBody"]["embeds"] do %>
                    <%= for embed <- msg["data"]["castAddBody"]["embeds"] do %>
                      <.link href={embed["url"]}>Link</.link>
                    <% end %>
                  <% end %>
                </div>
              </td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end
end
