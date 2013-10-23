<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Validator.ascx.cs" Inherits="Utils_Validator_Validator" %>

<div id="messageDisplayer" align="center" 
    style="color:Red;
            position:absolute;
            display:none;
            color: red;
            position: absolute;
            left: 67.5px;
            top: 645px;
            background-color: white;
            border: solid gray;
            border-radius: 20px;
            padding: 5px;">
</div>

<script type="text/javascript">
    function validate() {
        var targetMessage = jQuery('#messageDisplayer').text('').show();
        var strErrorMessage = '';
        var fieldNeedsCorrection = null;
        jQuery('[validate]').filter('[validationid = ' + event.target.attributes['validationid'].value + ']').each(function() {
            switch (jQuery(this).attr('validate')) {
                case 'number':
                    if (jQuery(this).val().trim() == '' || isNaN(jQuery(this).val()) || Number(jQuery(this).val()) < 0) {
                        strErrorMessage = 'Number did not pass validation.';
                        fieldNeedsCorrection = jQuery(this);
                        return false;
                    }
                    break;
                case 'required':
                    if (jQuery(this).val().trim() == '') {
                        strErrorMessage = 'Field is required.';
                        fieldNeedsCorrection = jQuery(this);
                        return false;
                    }
                    break;
                default:
            }
        });

        if (strErrorMessage != '') {
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