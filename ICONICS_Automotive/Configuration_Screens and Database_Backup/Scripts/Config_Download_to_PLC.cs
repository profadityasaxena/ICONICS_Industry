// [Declaring Function] Creating a function to download the configuration to the PLC
function Configuration_Download_to_PLC(sender : System.Object, cmdArgs : Ico.Gwx.CommandExecutionEventArgs){

    // [Declaring Variables]
    var input_from      :   System.Windows.Controls.TextBox=ThisConfiguration.GetObjectByName("input_from").ToDependencyObject();
    var input_to        :   System.Windows.Controls.TextBox=ThisConfiguration.GetObjectByName("input_to").ToDependencyObject();

	var input_from_id   :   GwxDynamic  = ThisConfiguration.GetDynamicObjectByName("input_from");
    var input_to_id     :   GwxDynamic  = ThisConfiguration.GetDynamicObjectByName("input_to");
	
    // dont understand
    var save_to_plc_command    :   GwxDynamic  = ThisConfiguration.GetDynamicObjectByName("SaveToPLCCmd");

    // [Establishing Connection with the Database] to be added


    // [Check for User Authentication] not being done yet | Code to be added later
    // [If-Else] If else statement based on user authentication status / logged in status | Assuming the user is logged in "1 = 1"
    if (1 = 1){
        var confirm_result  =   MessageBox.Show("Do you really want to save the current configurtation to PLC", "Confirmation", MessageBoxButton.YesNo);
        // [If Statement] This statement runs if the user confirms the command to save configuration to PLC
        if  (confirm_result == MessageBoxResult.Yes){
            input_from_id.WriteValueToPrimaryDataSource(input_from);
            input_to_id.WriteValueToPrimaryDataSource(input_to);
            save_to_plc_command.WriteValueToPrimaryDataSource(1);

            // [Notification to User] MessageBox Confirmation
            MessageBox.Show("This process will take some time to complete. \n\n Configuration for 'From ID' :- " + from_id.Text + " 'To ID' :- "+ to_id.Text +" will be updated in some time. Thank You");
        }
    } else {

    }

}