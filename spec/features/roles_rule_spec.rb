require 'spec_helper'

describe "New promotions" do
  before :each do
    Rails.application.config.spree.promotions.rules << RolesPromotionRule
    @role = create(:role)
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
    my_box = find("#role_list_#{@admin_role.id}")
    my_box.should be_checked
  end

  it "have nothing but admin role checked" do
    rolerule = RolesPromotionRule.new
    rolerule.role_list = [@admin_role.id]
    @promo.promotion_rules = [rolerule]
    visit "/admin/promotions/1/edit"
    my_box = find("#role_list_#{@role.id}")
    my_box.should_not be_checked
  end

  it "have both roles checked after a update" do
    rolerule = RolesPromotionRule.new
    rolerule.role_list = [@admin_role.id, @role.id]
    @promo.promotion_rules = [rolerule]
    visit "/admin/promotions/1/edit"
    within(:css, "#rules_container") do
      click_button "Update"
    end
    my_box = find("#role_list_#{@admin_role.id}")
    my_box.should be_checked
    my_box = find("#role_list_#{@role.id}")
    my_box.should be_checked
  end
end
