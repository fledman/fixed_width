class FixedWidth
  class Definition
    attr_reader :sections, :templates, :options

    def initialize(options={})
      @sections = []
      @templates = {}
      @options = { :align => :right }.merge(options)
    end

    def section(name, options = {}, &block)
      raise( ArgumentError, "Reserved or duplicate section name: '#{name}'") if
      Section::RESERVED_NAMES.include?( name ) || 
      (@sections.size > 0 && @sections.map{ |s| s.name }.include?( name ))

      section = FixedWidth::Section.new(name, @options.merge(options))
      section.definition = self
      yield(section)
      @sections << section
      section
    end

    def template(name, options={}, &block)
      section = FixedWidth::Section.new(name, @options.merge(options))
      yield(section)
      @templates[name] = section
    end

    def method_missing(method, *args, &block)
      section(method, *args, &block)
    end
  end
end