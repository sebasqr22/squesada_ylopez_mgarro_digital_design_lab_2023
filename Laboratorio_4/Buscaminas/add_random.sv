module add_random
(	 input wire clk,
	 input wire reset, 
    input wire [5:0] bomb_count,
    //input logic [7:0][7:0] cell_matrix_in,
	 output wire [5:0] bomb_Count,
    output logic [7:0][7:0] cell_matrix_out
);

    integer i;
    integer j;
	 integer bombs_added;
    int pseudo_random_order[7:0];
	 int pseudo_random_order_[7:0];
    logic [7:0][7:0] cell_matrix_variable;
	 logic [7:0][7:0] cell_matrix_v;
	 

	 
	 bin_to_decimal conversor (
    .binary_input(bomb_count),
    .decimal_output(bomb_Count)
	 );
	 
	 matriz matriz_inst (
      .clk(clk),                  // Conectar clk aquí
      .reset(reset),              // Conectar reset aquí
      .enable_matriz(1), // Ajusta enable_matriz según tus necesidades
      .matrizOutput(cell_matrix_v)  // Conectar cell_matrix_variable aquí
    );


	 
    always @(cell_matrix_v) begin
		  bombs_added = 0; 
        cell_matrix_variable = cell_matrix_v;
        pseudo_random_order = '{1, 7, 3, 5, 0, 4, 2, 6};
		  pseudo_random_order_ = '{2, 7, 4, 3, 0, 6, 5, 1};

        // Variable de control para detener la adición de bombas
   
        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                if (bombs_added == bomb_Count) begin // Cantidad de bombas 
                    
                    break;
                end
                if (cell_matrix_variable[pseudo_random_order[i]][pseudo_random_order[j]] == 4'd0) begin
                    // Agregar una bomba y actualizar la variable de control
                    cell_matrix_variable[pseudo_random_order_[i]][pseudo_random_order_[j]] = 4'd1;
                    bombs_added = bombs_added + 1;
                end
            end
        end

        cell_matrix_out = cell_matrix_variable;
    end

endmodule
