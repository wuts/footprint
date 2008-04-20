class ScaffoldResourceGenerator < Rails::Generator::NamedBase
  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_singular_name
  alias_method  :controller_table_name, :controller_plural_name
  attr_accessor :parent_name, 
                :parent_class_name,
                :parent_singular_name,
                :parent_plural_name

  def initialize(runtime_args, runtime_options = {})
    super

    # consider nested resource generator
    unless @class_nesting.empty?
      @class_path = ''    
      @table_name = ActiveRecord::Base.pluralize_table_names ? plural_name : singular_name
      @class_name = @class_name_without_nesting

      @parent_name = @class_nesting
      @parent_class_name, @parent_singular_name, @parent_plural_name = inflect_names(@parent_name) 

      modules = @name.include?('/') ? name.split('/') : name.split('::')
      @name    = modules.pop
      @file_path = @name.underscore    
    end

    @controller_name = @name.pluralize

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_singular_name, @controller_plural_name = inflect_names(base_name)

    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end

  def manifest
    return manifest_nested if @parent_name

    record do |m|
      # Check for class naming collisions.
      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
      m.class_collisions(class_path, "#{class_name}")

      # Controller, helper, views, and test directories.
      m.directory(File.join('app/models', class_path))
      m.directory(File.join('app/controllers', controller_class_path))
      m.directory(File.join('app/helpers', controller_class_path))
      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      m.directory(File.join('test/functional', controller_class_path))
      m.directory(File.join('test/unit', class_path))

      for action in scaffold_views
        m.template(
          "view_#{action}.rhtml",
          File.join('app/views', controller_class_path, controller_file_name, "#{action}.rhtml")
        )
      end

      # Layout and stylesheet.
      m.template('layout.rhtml', File.join('app/views/layouts', controller_class_path, "#{controller_file_name}.rhtml"))
      m.template('style.css', 'public/stylesheets/scaffold.css')

      m.template('model.rb', File.join('app/models', class_path, "#{file_name}.rb"))

      m.template(
        'controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template('functional_test.rb', File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb"))
      m.template('helper.rb',          File.join('app/helpers',     controller_class_path, "#{controller_file_name}_helper.rb"))
      m.template('unit_test.rb',       File.join('test/unit',       class_path, "#{file_name}_test.rb"))
      m.template('fixtures.yml',       File.join('test/fixtures', "#{table_name}.yml"))

      unless options[:skip_migration]
        m.migration_template(
          'migration.rb', 'db/migrate', 
          :assigns => {
            :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}",
            :attributes     => attributes
          }, 
          :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
        )
      end

      m.route_resources controller_file_name
    end
  end

  def manifest_nested
    record do |m|
      # Check for class naming collisions.
      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
      m.class_collisions(class_path, "#{class_name}")

      # Controller, helper, views, and test directories.
      m.directory(File.join('app/models', class_path))
      m.directory(File.join('app/controllers', controller_class_path))
      m.directory(File.join('app/helpers', controller_class_path))
      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      m.directory(File.join('test/functional', controller_class_path))
      m.directory(File.join('test/unit', class_path))

      for action in scaffold_views
        m.template(
          "nested_view_#{action}.rhtml",
          File.join('app/views', controller_class_path, controller_file_name, "#{action}.rhtml")
        )
      end

      # Layout and stylesheet.
      m.template('layout.rhtml', File.join('app/views/layouts', controller_class_path, "#{controller_file_name}.rhtml"))
      m.template('style.css', 'public/stylesheets/scaffold.css')

      m.template('nested_model.rb', File.join('app/models', class_path, "#{file_name}.rb"))

      m.template(
        'nested_controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template('nested_functional_test.rb', File.join('test/functional', controller_class_path, "#{controller_file_name}_controller_test.rb"))
      m.template('helper.rb',          File.join('app/helpers',     controller_class_path, "#{controller_file_name}_helper.rb"))
      m.template('unit_test.rb',       File.join('test/unit',       class_path, "#{file_name}_test.rb"))
      m.template('nested_fixtures.yml',       File.join('test/fixtures', "#{table_name}.yml"))

      unless options[:skip_migration]
        m.migration_template(
          'nested_migration.rb', 'db/migrate', 
          :assigns => {
            :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}",
            :attributes     => attributes
          }, 
          :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
        )
      end

      m.route_resources controller_file_name
    end
  end

  protected
    # Override with your own usage banner.
    def banner
      "Usage: #{$0} scaffold_resource ModelName [field:type, field:type]"
    end

    def scaffold_views
      %w[ index show new edit ]
    end

    def model_name 
      class_name.demodulize
    end
end
