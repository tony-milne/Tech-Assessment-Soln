module VerifyModule
  require 'digest/md5'
  
  def self.included(base)
    base.class_eval do
      after_validation_on_create :set_md5
      before_update :set_unverified, :update_md5
    end
  end
  
  private
  
  def set_unverified
    puts "set_unverified called"
    if !compare_md5
      self.verified = 0
    end
  end
  
  def set_md5
    puts "set_md5 called"
    self.md5 = generate_md5
  end
  
  def compare_md5
    puts "current: " + self.md5
    puts "generated: " + generate_md5
    if (generate_md5 == self.md5)
      puts "true"
      return true
    else
      puts "false"
      return false
    end
  end
  
  def generate_md5
    attributes = self.attribute_names
    
    attributes.delete_if { |a| a == "verified" }
    attributes.delete_if { |a| a == "created_at" }
    attributes.delete_if { |a| a == "updated_at" }
    attributes.delete_if { |a| a == "id" }
    attributes.delete_if { |a| a == "md5" }
    
    str = ""
    attributes.each do |a|
      str += send("#{a}").to_s
    end
    
    d = Digest::MD5.new
    d << str
    ret_str = d.to_s
    return ret_str
  end
  
  def update_md5
    self.md5 = generate_md5
  end  
end
