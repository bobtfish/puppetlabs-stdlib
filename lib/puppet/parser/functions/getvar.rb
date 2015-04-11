module Puppet::Parser::Functions

  newfunction(:getvar, :type => :rvalue, :doc => <<-'ENDHEREDOC') do |args|
    Lookup a variable in a remote namespace.

    For example:

        $foo = getvar('site::data::foo')
        # Equivalent to $foo = $site::data::foo

    This is useful if the namespace itself is stored in a string:

        $datalocation = 'site::data'
        $bar = getvar("${datalocation}::bar")
        # Equivalent to $bar = $site::data::bar
    ENDHEREDOC

    if !args.length.between?(1, 2)
      raise Puppet::ParseError, ("getvar(): wrong number of arguments (#{args.length}; must be 1)")
    end

    if self.include? args[0]
      self.lookupvar args[0]
    else
      args[1]
    end

  end

end
