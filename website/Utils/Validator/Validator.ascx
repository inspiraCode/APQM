<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Validator.ascx.cs" Inherits="Utils_Validator_Validator" %>
<div id="scrim" style="display: none; position: fixed; min-height: 100%; min-width: 100%;
    z-index: 5000; background-color: black; opacity: 0.3; top: 0; left: 0;" onclick="hideScrim()">
</div>

<div id="messageDisplayer" align="center" style="color: Red; position: absolute;
    display: none; color: red; position: absolute; left: 67.5px; top: 645px; background-color: white;
    border: solid gray; border-radius: 20px; padding: 5px; z-index: 5001;">
</div>

<script type="text/javascript">
    jQuery('body').keydown(function() {
        hideScrim();
    });    
    function hideScrim() {
        jQuery('#scrim').hide();
        jQuery('#messageDisplayer').hide();
    }
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
    function validate() {    
        var targetMessage = jQuery('#messageDisplayer').text('');
        var strErrorMessage = '';
        var fieldNeedsCorrection = null;
        var target = event.target ? event.target : event.srcElement;
        jQuery('[validate]').filter('[validationid = ' + target.attributes['validationid'].value + ']').each(function() {
            if (jQuery(this).css('display') != "none" && jQuery(this).is(":visible")) {
                jQuery(this).val(jQuery(this).val().trim());
                switch (jQuery(this).attr('validate')) {
                    case 'number':
                        if (jQuery(this).val() == '')
                            jQuery(this).val(0);
                        if (isNaN(jQuery(this).val()) || Number(jQuery(this).val()) < 0) {
                            strErrorMessage = 'Number did not pass validation.';
                            fieldNeedsCorrection = jQuery(this);
                            return false;
                        }
                        break;
                    case 'required':
                        if (jQuery(this).val() == '') {
                            strErrorMessage = 'Field is required.';
                            fieldNeedsCorrection = jQuery(this);
                            return false;
                        }
                        break;
                    case 'email':
                        if (!validateEmail(jQuery(this).val())) {
                            strErrorMessage = 'Email did not pass validation.';
                            fieldNeedsCorrection = jQuery(this);
                            return false;
                        }
                        break;
                    default:
                }
            }
        });

        if (strErrorMessage != '') {
            jQuery('#scrim').show();
            targetMessage.text('Please verify field. ' + strErrorMessage).show();
            var pos = fieldNeedsCorrection.position();
            targetMessage.css('left', (pos.left - 9) + 'px');
            targetMessage.css('top', (pos.top + fieldNeedsCorrection.outerHeight() + 2) + 'px');
            fieldNeedsCorrection.focus().select();
            return false;
        }
        return true;
    }
</script>

