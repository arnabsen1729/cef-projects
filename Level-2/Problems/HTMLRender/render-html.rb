# The HTML will be parsed as a Data Structure which will then be displayed in the cli

node1 = {
  :tag => "h1",
  :text => "Welcome to SaaS 201",
}

node2 = {
  :tag => "div",
  :children => [
    {
      :tag => "h2",
      :text => "The Ruby language",
    },
    {
      :tag => "p",
      :text => "Ruby is built for programmer's happiness",
    },
  ],
}

html = {
  :tag => "div",
  :children => [node1, node2],
}

def render(node)
  if node[:tag] == "div"
    children = node[:children]
    children.each { |childNode| render(childNode) }
  elsif node[:tag] == "h1"
    puts "**** #{node[:text].upcase} ****"
  elsif node[:tag] == "h2"
    puts "** #{node[:text]} **"
  else
    puts node[:text] || ""
  end
end

render(html)
