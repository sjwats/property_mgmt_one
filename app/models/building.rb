class Building < ActiveRecord::Base
  USASTATES = %w{
    AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS
    MO MT NE NV NH NJ NM NY NC ND OH OK OR PA PR RI SC SD TN TX UT VT VA WA WV
    WI WY}
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :postal_code
  validates_length_of :postal_code, is: 5
  validates_presence_of :state
  validates_inclusion_of :state, in: USASTATES
  validates_presence_of :owner

  belongs_to :owner,
  inverse_of: :buildings

  def self.usa_states
    ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA', 'HI', 'ID',
    'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS',
    'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK',
    'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA',
    'WV', 'WI', 'WY']
  end

end
