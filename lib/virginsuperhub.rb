#!/usr/bin/env ruby

# file: virginsuperhub.rb


require 'ferrumwizard'


class SuperHub2
  using ColouredText
  
  attr_reader :fw # helpful for development and debugging

  def initialize(host_ip='192.168.0.1', passwordx=nil, headless: true, 
                 password: passwordx, timeout: 10, debug: false, verbose: true)
    
    @headless, @verbose = headless, verbose
    puts "SuperHub2".highlight; puts if verbose
    
    @fw = FerrumWizard.new("http://#{host_ip}/VmLogin.asp", 
                           headless: headless, debug: debug, timeout: timeout)    
    
    login(password) if password

  end

  def login(password)
    
    @fw.login(nil, password)
    puts 'logged in'.info if @verbose
    sleep 2
    self
    
  end
  
  def reboot()
    
    @fw.advanced.reboot.reboot   
    puts 'rebooting ...'.info if @verbose
    
    sleep 2 unless @headless
    
    @fw.quit   
    puts 'browser window closed'.info if @verbose
    
  end

  def wifi(state)

    @fw.wireless.method(state.to_sym).call.save.apply(2)
    puts ('Wifi is now ' + state.to_s).info if @verbose
    sleep 2
    self

  end
  
  def wifi_on()  wifi(:on)   end
  def wifi_off() wifi(:off)  end

  def logout()
    @fw.sign_out
    puts 'signed out'.info if @verbose
    sleep 2 unless @headless
    @fw.quit
  end

end
