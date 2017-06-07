if defined?(ChefSpec)
  ChefSpec.define_matcher :mysql_db
  ChefSpec.define_matcher :postgresql_db

  def run_mysql_db(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:mysql_db, :run, resource_name)
  end

  def run_postgresql_db(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:postgresql_db, :run, resource_name)
  end
end
