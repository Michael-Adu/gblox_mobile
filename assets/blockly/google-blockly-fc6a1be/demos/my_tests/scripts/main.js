Blockly.Blocks['if'] = {
     init: function() {
       this.appendDummyInput()
           .appendField("if");
       this.appendValueInput("condition")
           .setCheck("Boolean");
       this.appendStatementInput("if")
           .setCheck(null);
       this.setInputsInline(true);
       this.setPreviousStatement(true, null);
       this.setNextStatement(true, null);
       this.setMutator(new Blockly.Mutator(['else_if', 'else']));
    this.setTooltip("");
    this.setHelpUrl("");
     },
   };
   
   Blockly.Blocks['else_if'] = {
     init: function() {
       this.appendDummyInput()
           .appendField("else if");
       this.appendValueInput("condition")
           .setCheck("Boolean");
       this.appendStatementInput("else_if")
           .setCheck(null);
       this.setInputsInline(true);
       this.setPreviousStatement(true, null);
       this.setNextStatement(true, null);
    this.setTooltip("");
    this.setHelpUrl("");
     }
     
   };
   
   Blockly.Blocks['else'] = {
     init: function() {
       this.appendDummyInput()
           .appendField("else");
       this.appendStatementInput("else")
           .setCheck(null);
       this.setInputsInline(true);
       this.setPreviousStatement(true, null);
       this.setNextStatement(true, null);
    this.setTooltip("");
    this.setHelpUrl("");
     }
   };

   Blockly.JavaScript['if'] = function(block) {
     var value_condition = Blockly.JavaScript.valueToCode(block, 'condition', Blockly.JavaScript.ORDER_ATOMIC);
     var statements_if = Blockly.JavaScript.statementToCode(block, 'if');
     // TODO: Assemble JavaScript into code variable.
     var code = '...;\n';
     return code;
   };
   
   Blockly.JavaScript['else_if'] = function(block) {
     var value_condition = Blockly.JavaScript.valueToCode(block, 'condition', Blockly.JavaScript.ORDER_ATOMIC);
     var statements_if = Blockly.JavaScript.statementToCode(block, 'if');
     // TODO: Assemble JavaScript into code variable.
     var code = '...;\n';
     return code;
   };

Blockly.Blocks['en'] = {
     init: function () {
          var checkbox = new Blockly.FieldCheckbox("TRUE", function (pxchecked) {
               this.sourceBlock_.updateShape_(pxchecked);
          });
          this.setInputsInline(false);
          this.appendDummyInput()
               .appendField("Unit")
               .appendField(new Blockly.FieldTextInput("C01"), "ENName");
          this.appendDummyInput()
               .appendField("PX")
               .appendField(checkbox, 'HasPX');
          this.setPreviousStatement(true, ["C", "EN"]);
          this.setNextStatement(true, ["C", "EN"]);
          this.setColour(40);
     },
     /**
      * Create XML to represent whether the 'pxchecked' should be present.
      * @return {Element} XML storage element.
      * @this Blockly.Block
      */
     mutationToDom: function () {
          var container = document.createElement('mutation');
          var pxchecked = (this.getFieldValue('HasPX') == 'TRUE');
          container.setAttribute('pxchecked', pxchecked);
          return container;
     },
     /**
      * Parse XML to restore the 'pxchecked'.
      * @param {!Element} xmlElement XML storage element.
      * @this Blockly.Block
      */
     domToMutation: function (xmlElement) {
          var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
          this.updateShape_(pxchecked);
     },
     /**
      * Modify this block to have (or not have) an input for 'HasPX'.
      * @param {boolean} pxchecked True if this block HasPX is pxchecked.
      * @private
      * @this Blockly.Block
      */
     updateShape_: function (pxchecked) {
          // Add or remove a Value Input.
          if (pxchecked) {
               this.appendValueInput("PX")
                    .setCheck('PX');
          } else {
               if (this.childBlocks_.length > 0) {
                    for (var i = 0; i < this.childBlocks_.length; i++) {
                         if (this.childBlocks_[i].type == 'px') {
                              this.childBlocks_[i].unplug();
                              break;
                         }
                    }
               }
               this.removeInput('PX');
          }
     }
};




function updateCode() {
     var code = Blockly.Xml.workspaceToCode(Blockly.mainWorkspace);
     document.getElementById('total_code').innerHTML = code;
     alert("Updated Code")
}