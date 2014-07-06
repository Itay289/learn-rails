class Contact < ActiveRecord::Base
  has_no_table

  column :name, :string
  column :email, :string
  column :content, :string

  validates :name, presence: true
  validates :email, presence: true,
  presence: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :content, presence: true,
  length: { maximum: 500 }

  def update_spreadsheet
    connection = GoogleDrive.login(Rails.application.secrets.email_provider_username,
      Rails.application.secrets.email_provider_password)

    ss = connection.spreadsheet_by_title('Learn-Rails-Exaple')
    if ss.nil?
      ss = connection.create_spreadsheet('Learn-Rails-Exaple')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end

end      

          