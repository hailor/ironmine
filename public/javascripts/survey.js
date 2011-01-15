GY.use('node',function (Y){
   var form_add_field = function (){
       Y.all('#fields').append(Y.all('#field_template').get('innerHTML'));
       var new_field = Y.all('#fields').all('.edit'),last;
       if (new_field.size()) {
          new_field = new_field.item(new_field.size() - 1);
       }
       Y.all(new_field[0]).set('id','last_field');
       Y.all(new_field).all('.question').hide();
       Y.all(new_field).all('.from').show();
       Y.all(new_field).all('.form #field_name').set('value',new_question_title + (field_count - 100)).css('color','#666');
       Y.all(new_field).css('background-color','#FDF2C6');
       Y.all(new_field).all('.question label.question label').setContent(new_question_title + (field_count - 100));
       field_count += 1;
       Y.all(new_field).all('.field_position').set(field_count);
       var now = new Date();
       Y.all(new_field).all('.form #field_uuid').set(now.getTime());
       Y.all("#saving").show();
       Y.all(new_field).all('#field_submit').submit();
   };
});