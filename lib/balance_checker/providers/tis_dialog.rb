require 'rubygems'
require 'mechanize'
require 'uri'

module Providers
  class TisDialog
    attr_reader :login, :password, :name

    def initialize options = {}
      @name = options.fetch(:name, nil)
      raise ArgumentError, "no config for provider #{self.class}" unless @name
      @login = options.fetch(:login)
      @password = options.fetch(:password)
    end

    def check
      agent = Mechanize.new
      agent.user_agent_alias = 'Linux Firefox'
      agent.keep_alive = false
      agent.read_timeout = 10

      main_page = agent.get('https://stats.tis-dialog.ru/')

      form = main_page.form_with(action: 'index.php')
      form.field_with(name: 'login').value = login
      form.field_with(name: 'passv').value = password

      response_page = form.submit

      balance_from_page(response_page)
    end

    private

    def balance_from_page page
      page.search('//td[a[@class = "goEdit"]]/text()').to_s.split(' ')[0].sub(',','.').to_f
    end

  end
end
