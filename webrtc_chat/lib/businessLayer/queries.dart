import 'global.dart' as global;

class NovamaxAPIs {
  var channel = "Android";

  String loginAccount() {
    return """
    mutation technicianLogin(\$device_id: String!, \$userName: String!, \$platform: String!, \$token: String!, \$password: String!) {
      dealer_login(
        input: {
          username: \$userName
          password: \$password
          device_info: \$token
          device_token: \$device_id
        }
        channel: \$platform
        version: "${global.appVersionCode}"
      ) {
        status
        message
        err_message
        token_type
        access_token
        type
        both
        user {
          name
          id
          username
          dob
          cover
          mobile
          email
          anniversary_at
          gender
        }
        orgs {
          name
          code
        }
        brand_org {
          name
          code
          cover
          color
        }
        address{
          id
          full_address
        }
      }
    }
""";
  }

  String Onediosresources() {
    return """
      query Onediosresources(\$typeName: String){
        resources(
          name: \$typeName
          user_id:${global.currentUserData.checkotpNew!.user!.id}
          version: "${global.appVersionCode}"
          channel: "consumer-${global.appplatform}"
        ) {
          responseInfo {
            status
            message
            error
          }
          initial_name
          data {
            title
            metas {
              key
              value
            }
            racks {
              image {
                cover
              }
              name
              footer
              layout_type
              destination_type
              footer_url
              title
              metas {
                key
                value
              }
              rackdetails {
                title
                name
                destination_url
                image_view
                description
                destination_type
                ratio
                metas {
                  key
                  value
                }
                attachments {
                  cover
                  type
                }
              }
            }
          }
        }
      }
    """;
  }

  String fetchProductsWithFilters() {
    return """
      query QueryRequestData(\$updateUrl: String, \$page: Int){
        products_with_filters(
          page_name: ""
          page: \$page
          first:100
          url: \$updateUrl
          user_id: ${global.currentUserData.checkotpNew!.user!.id}
          version: "${global.appVersionCode}"
          channel: "consumer-${global.appplatform}"
        ) {
          first_filter_key
          url_param
          main_url
          applied_filter_keys_count
          filter_options {
            filter_key
            filter_type
            total_filter
            filter_applied
            enabled_filters
          }
          filtered_products {
            paginatorInfo {
              total
              count
              hasMorePages
            }
            data {
              rating
              rating_count
              rating_color
              inventory_count
              inventory_count_label
              cart_item_count
              description
              images {
                cover
                id
              }
              message_points {
                message
              }
              id
              sku
              name
              cover
              slug
              mrp
              original_price
              discounted_price
              discount_percent
              url_param
              service_cart_count
              variant_label
              variant_products {
                inventory_count
                inventory_count_label
                cover
                id
                label
                url_param
                price_info {
                  original_price_display
                  discount_percent_display
                  discounted_price_display
                }
                cart_item_count
              }
              brand {
                id
                name
                cover
              }
            }
          }
        }
      }
    """;
  }
}
