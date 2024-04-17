connection: "tvmssql"

#include: "/views/*.view.lkml"
#include: "/adv_views/Production/product.view.lkml"
#include: "/adv_views/Purchasing/purchase_order_detail.view.lkml"  # include all views in this project
# include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
explore: product {
  join: purchase_order_detail {
    type: left_outer
    relationship: one_to_one
    sql_on: ${product.product_id} = ${purchase_order_detail.product_id} ;;
  }
}
