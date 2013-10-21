<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Validator.ascx.cs" Inherits="Utils_Validator_Validator" %>

<div id="validationMessage" style="color:Red;display:none"></div>

<script type="text/javascript">
    function validate() {
        jQuery('#validationMessage').text('').show();
        
        var strErrorMessage = '';
        var fieldNeedsCorrection = null;
        jQuery('[validate]').each(function() {
            switch (jQuery(this).attr('validate')) {
                case 'number':
                    if (jQuery(this).val().trim() == '' || Number(jQuery(this).val()) < 0) {
                        strErrorMessage = 'Number did not pass validation.';
                        fieldNeedsCorrection = jQuery(this);
                    }
                    break;
                default:
            }
        });

        if (strErrorMessage != '') {
            jQuery('#validationMessage').text('Please verify field. ' + strErrorMessage).show();
            fieldNeedsCorrection.focus();
            return false;
        }

        return true;
    }
</script>