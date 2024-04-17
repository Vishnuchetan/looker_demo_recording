view: purchase_order_detail {
  sql_table_name: Purchasing.PurchaseOrderDetail ;;

  dimension_group: due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.DueDate ;;
  }
  dimension: line_total {
    type: string
    sql: ${TABLE}.LineTotal ;;
  }
  dimension_group: modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ModifiedDate ;;
  }
  dimension: order_qty {
    type: number
    sql: ${TABLE}.OrderQty ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }
  dimension: purchase_order_detail_id {
    type: number
    sql: ${TABLE}.PurchaseOrderDetailID ;;
  }
  dimension: purchase_order_id {
    type: number
    sql: ${TABLE}.PurchaseOrderID ;;
  }
  dimension: received_qty {
    type: number
    sql: ${TABLE}.ReceivedQty ;;
  }
  dimension: rejected_qty {
    type: number
    sql: ${TABLE}.RejectedQty ;;
  }
  dimension: stocked_qty {
    type: number
    sql: ${TABLE}.StockedQty ;;
  }
  dimension: unit_price {
    type: string
    sql: ${TABLE}.UnitPrice ;;
  }
  measure: count {
    type: count
    drill_fields: [product.product_id, product.name]
  }
  measure: sumofstockedqty {
    type: sum
    drill_fields: [purchase_order_detail.StockedQty]
  }
}
