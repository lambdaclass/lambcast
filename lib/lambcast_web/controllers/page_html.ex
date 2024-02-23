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
          <th>Parent Fid</th>
        </tr>
      </thead>
      <tbody id="messages">
        <%= for msg <- @messages do %>
          <tr>
            <td class="border"><%= msg["data"]["castAddBody"]["text"] %></td>
            <td class="border"><%= msg["data"]["timestamp"] %></td>
            <td class="border"><%= msg["data"]["castAddBody"]["parentCastId"]["fid"] %></td>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end
end
