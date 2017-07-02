class EmotionSerializer < ActiveModel::Serializer
   attributes :error, :name, :url

   def name
     "PDfs fetched successfully."
   end

end
