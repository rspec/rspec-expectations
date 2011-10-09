module Webby
  module Resources
    class DB
      def immediate_children( page, opts = {} )
        root = page.dir == "" ? "" : "#{page.dir}/"
        rgxp = Regexp.new "\\A#{root}[^/]+$"
        keys = @db.keys.find_all {|k| rgxp =~ k}

        ary  = keys.map {|k| @db[k]}
        ary.flatten!

        return ary unless opts.has_key? :sort_by

        m = opts[:sort_by]
        ary.sort! {|a,b| a.__send__(m) <=> b.__send__(m)}
        ary.reverse! if opts[:reverse]
        ary
      end
    end

    class Resource
      def link
        "<a href=\"#{url}\">#{title}</a>"
      end
    
      def order
        (@_meta_data['order'] || 10000).to_i
      end
    
      def path_from_root
        resources = []
        resource = self
        while(resource)
          resources << resource
          resource = Webby::Resources.pages.parent_of(resource)
        end
        resources.reverse
      end
    
      def siblings
        Webby::Resources.pages.siblings(self).reject{|p| p.title.nil?}
      end

      def immediate_children
        Webby::Resources.pages.immediate_children(self).reject{|p| p.title.nil?}.select{|p| p.filename == 'index'}
      end
    end
  end
  
  class Renderer
    def rspec_version
      "2.7.0.rc1"
    end
    
    def rspec_rails_version
      "2.7.0.rc1"
    end

    def breadcrumb_menu(page)
      '<div class="breadcrumb-menu">' + breadcrumbs(page) + menu(page) + '</div>'
    end
    
    def breadcrumbs(page)
      b = binding
      ERB.new(<<-EOF, nil, '-').result(b)
      <div class="breadcrumbs">
        <ul>
        <% page.path_from_root.each do |p| %>
          <% if p != page %>
            <li><%= p.link %></li>
          <% else %>
            <li class="current"><%= p.link %></li>
          <% end %>
        <% end %>
        </ul>
      </div>
      EOF
    end

    def menu(page)
      pages = if page.filename == 'index'
        (page.siblings + page.immediate_children).sort{|a,b| a.order <=> b.order}
      else
        []
      end
      
      b = binding
      ERB.new(<<-EOF, nil, '-').result(b)
      <div class="menu">
        <ul>
        <% pages.each do |p| %>
          <li>
            <%= p.link %>
          </li>
        <% end %>
        <% if page.url == '/documentation/' %>
          <li>
            <a href="http://github.com/dchelimsky/rspec/wikis/home" target="_blank">Install</a>
          </li>
          <li>
            <a href="http://rdoc.info/gems/rspec/#{rspec_version}/frames" target="_blank">RDoc</a>
          </li>
        <% end %>
        <% if page.url == '/rails/' -%>
          <li>
            <a href="http://github.com/dchelimsky/rspec-rails/wikis/home" target="_blank">Install</a>
          </li>
          <li>
            <a href="http://rdoc.info/gems/rspec-rails/#{rspec_rails_version}/frames" target="_blank">RDoc</a>
          </li>
        <% end -%>
        </ul>
      </div>
      EOF
    end
    
  end
end

# This patches a bug in webby-0.8.2 in which the coderay method fails to add a
# newline resulting in webby formatting problems.
module Webby::Helpers::CodeRayHelper
  alias :orig_coderay :coderay
  
  def coderay( *args, &block )
    orig_coderay *args, &block
    buffer = eval('_erbout', block.binding)
    pos = buffer.length
    buffer[pos..-1] = "\n"
    return
  end
end
