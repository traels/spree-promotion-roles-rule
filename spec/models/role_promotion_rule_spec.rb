require 'spec_helper'

describe "Admin role promotion" do
  before :each do
    # rule only for admin role
    @rule = RolesPromotionRule.new
    @rule.role_list = [create(:admin_role).id]
    @order = create(:order)
  end

  it "is only eligible for 1 user" do
    @rule.role_list.count.should == 1
  end

  it "is eligible for admin user" do
    @order.user = create(:admin_user)
    @rule.eligible?(@order).should == true
  end

  it "is not eligible for other users" do
    @rule.eligible?(@order).should == false
  end
end