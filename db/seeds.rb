# frozen_string_literal: true

User.where(name: 'John Doe', email: 'user@example.com').first_or_create password: 'password'
User.where(name: 'Jane Doe', email: 'jane@example.com').first_or_create password: 'password'
