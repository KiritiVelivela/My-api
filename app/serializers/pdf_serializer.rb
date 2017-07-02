class PdfSerializer < ActiveModel::Serializer
  attributes :error, :name, :url



  def error
    "false"
  end

end
