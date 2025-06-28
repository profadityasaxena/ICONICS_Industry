// [Creating Function to Handle To Field Value]
function InputFromField_TextChanged(sender : System.Object, e : System.Windows.Controls.TextChangedEventArgs){
    try {
        
        var input_from   :   System.Windows.Controls.TextBox=ThisConfiguration.GetObjectByName("input_from").ToDependencyObject();
        from_id       =     int;
        from_id       =     input_from;

        //[Validation Code] This Snippet Validates the Input Value | Code can be added below if any type of input validation is required.

    } catch (ex : Exception){
        MessageBox.Show (ex.Message);	
    }
}