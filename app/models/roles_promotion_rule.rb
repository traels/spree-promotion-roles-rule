#class RolePromotionRule < Spree::PromotionRule
#  def eligible?(order)
#    order.user.has_spree_role? self.class.name.gsub(/RolePromotionRule/, '').downcase 
#  end
#end


class RolesPromotionRule < Spree::PromotionRule
  attr_accessible :role_ids_string, :role_list

  belongs_to :role, :class_name => '::Spree::Role'
  has_and_belongs_to_many :roles, :class_name => '::Spree::Role',
    :join_table => 'roles_promotion_rules', :foreign_key => 'promotion_rule_id',
    :association_foreign_key => 'role_id'

  def eligible?(order, options = {})
    roles.each do |r|
      return true if order.user and order.user.has_spree_role?(r.name)
    end
    false
  end

#  def role_ids_string
#    role_ids.join(',')
#  end

#  def role_ids_string=(s)
#    self.role_ids = s.to_s.split(',').map(&:strip)
#  end

  def role_list
    self.role_ids
  end
  def role_list=(a)
    self.role_ids = a
  end
end
