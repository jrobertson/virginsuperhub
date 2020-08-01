#!/usr/bin/env ruby

# file: virginsuperhub.rb


require 'ferrumwizard'



class SuperHub2

  def initialize(host_ip='192.168.0.1', headless: true)
    @fw = FerrumWizard.new("http://#{host_ip}/VmLogin.asp", headless: headless, debug: true)
  end

  def login(password)
    @fw.login(nil, password)
    sleep 2
    self
  end

  def wifi(state)

    @fw.wireless.method(state.to_sym).call.save.apply(2)
    sleep 2
    self

  end

  def logout()
    @fw.sign_out
    sleep 2
    @fw.quit
  end

end
