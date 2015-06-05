class WelcomeController < ApplicationController

  def index
    @welcome =
        { name: 'ColdAPI',
          for: 'QuebraGelo',
          current_version: { version: 'v1', codename: 'Apollo'},
          who: [{ name: 'Bruno Casali', contact: '@brunoocasali' },
                { name: 'Alan Darold', contact: '' },
                { name: 'João Vanin', contact: '' }],
          start:
              {
                  docs: 'no docs, for while',
                  why: 'Are not you tired of sameness?',
                  homes: %w(https://github.com/Unisep/quebra-gelo-api http://quebra-gelo.strikingly.com/)
              }
        }

    respond_with @welcome
  end
end
