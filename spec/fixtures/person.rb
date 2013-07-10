class Person < WsHashie::Dash
  property :name, :required => true
  property :email
  property :occupation, :default => 'Rubyist'
end
