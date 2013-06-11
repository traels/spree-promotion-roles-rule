require 'spec_helper'

describe "New promotions" do
  before :each do
    create(:role)
    @admin_role = create(:admin_role)
    sign_in_admin!(create(:admin_user))
    @promo = create(:promotion)
  end

  it "have a role rule" do
    visit "/admin/promotions/1/edit"
    page.should have_content("Roles")
  end

  it "have a checkbox per role" do
    @promo.promotion_rules = [RolesPromotionRule.new]
    visit "/admin/promotions/1/edit"
    page.should have_content("admin")
  end

  it "have admin role checked" do
    rolerule = RolesPromotionRule.new
    rolerule.role_list = [@admin_role.id]
    @promo.promotion_rules = [rolerule]
    visit "/admin/promotions/1/edit"
    my_box = find('#role_list_admins')
    my_box.should be_checked
  end
end