// [Creating Function to Handle To Field Value]
function InputToField_TextChanged(sender : System.Object, e : System.Windows.Controls.TextChangedEventArgs){
    try {
        
        var input_to   :   System.Windows.Controls.TextBox=ThisConfiguration.GetObjectByName("input_to").ToDependencyObject();
        to_id       =     int;
        to_id       =     input_to;

        //[Validation Code] This Snippet Validates the Input Value | Code can be added below if any type of input validation is required.

    } catch (ex : Exception){
        MessageBox.Show (ex.Message);	
    }
}