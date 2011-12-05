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
      "2"
    end
    
    def breadcrumb_menu(page)
      ""
    end
    
    def breadcrumbs(page)
      ""
    end

    def menu(page)
      ""
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
