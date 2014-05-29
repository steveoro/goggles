require 'framework/naming_tools'
require 'framework/version'


class AddRequiredParameters < ActiveRecord::Migration

  def up
    say 'creating a parameter row for each controller...'

    AppParameter.transaction do                     # -- START TRANSACTION --
      AppParameter.create([                         # Create the versioning parameter
          {
            code: AppParameter::PARAM_VERSIONING_CODE, :a_string => Version::DB,
            :a_bool => false, :a_integer => 1, :a_name => Version::FULL + ' (core-six)', :code_type_1 => 0,
            description: "a_string: DB struct version\r\na_name:   Framework & source version\r\na_integer: default user firm_id\r\ncode_type_1: default currency override (from current firm_id)"
          }
      ])

      NamingTools::PARAM_CTRL_SYMS.each { |ctrl_sym|
        code = get_code_for_ctrl( ctrl_sym )
        common_attr_hash = {                        # Prepare the hash of attributes that surely will go into the parameter row:
            code: code,
            AppParameter::CTRL_NAME_FIELD.to_sym => ctrl_sym.to_s,
            AppParameter::PAGINATION_ENABLE_FIELD.to_sym => false,
            AppParameter::PAGINATION_ROWS_FIELD.to_sym => 20,
            AppParameter::FILTERING_RADIUS_FIELD.to_sym => 180,
            AppParameter::FILTERING_STRFTIME_FIELD.to_sym => '%Y-1-1',
            description: "Dedicated parameter row for controller defaults.\r\n\r\n" +
                            "- controller_name: name of the controller which uses this row\r\n" +
                            "- range_x: default pagination backwards range in days (applied from current date)\r\n" +
                            "- range_y: max pagination rows\r\n" +
                            "- free_text_1: string format for range_x approx. (when present)"
        }
                                                    # Add more default values in certain cases:
# [Steve, 20130726] Code left here as future reference; unused as of this version
# (so far, there are no default values defined inside NamingTools)

        # if ( ctrl_sym == :invoices )
          # common_attr_hash.merge!(
            # NamingTools.get_field_name_for_default_value_in_app_parameters_for(:invoices, :soc_security) => 0.04,
            # NamingTools.get_field_name_for_default_value_in_app_parameters_for(:invoices, :account_wage) => 0.2,
            # NamingTools.get_field_name_for_default_value_in_app_parameters_for(:invoices, :vat_tax) => 0.21,
            # NamingTools.get_field_name_for_default_value_in_app_parameters_for(:invoices, :discount) => 0.0
          # )
        # end
                                                    # Save the row:
        say "adding param. row for controller #{ctrl_sym} w/ code #{code}"
  # DEBUG
        say "DEBUG: attribute hash:\r\n===((#{common_attr_hash.inspect}))==="
        AppParameter.create common_attr_hash
      }
    end                                             # -- END TRANSACTION --

    say 'verifying the existence of the parameters...'
    raise "Parameter row not found with code #{AppParameter::PARAM_VERSIONING_CODE}!" unless AppParameter.find_by_code( AppParameter::PARAM_VERSIONING_CODE )
    NamingTools::PARAM_CTRL_SYMS.each { |ctrl_sym|
      code = get_code_for_ctrl( ctrl_sym )
      say "seeking param. row for controller #{ctrl_sym} w/ code #{code}"
      raise "Parameter row not found with code #{code}!" unless AppParameter.find_by_code( code )
    }
    say 'done.'
  end


  def down
    say 'deleting all new parameters rows for each controller...'
    NamingTools::PARAM_CTRL_SYMS.each { |ctrl_sym|
      code = get_code_for_ctrl( ctrl_sym )
      say "deleting param. row for controller #{ctrl_sym} w/ code #{code}"
      AppParameter.where( code: code ).delete_all
    }
    AppParameter.where( code: AppParameter::PARAM_VERSIONING_CODE ).delete_all
    say 'done.'
  end


  private


  def get_code_for_ctrl( ctrl_sym )
    AppParameter::PARAM_CTRL_START + NamingTools::PARAM_CTRL_SYMS.index( ctrl_sym ) * AppParameter::PARAM_CTRL_CODE_STEP
  end
end
