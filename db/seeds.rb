data = [{
  name: 'Bitcoin - AUD',
  code: 'BTCAUD'
},{
  name: 'Ethereum - AUD',
  code: 'ETHAUD'
}]

data.each do |_attrs|
  Currency.create(_attrs)
end