if defined?(ChefSpec)
  ChefSpec.define_matcher :mysql_db

  def run_mysql_db(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:mysql_db, :run, resource_name)
  end
end
