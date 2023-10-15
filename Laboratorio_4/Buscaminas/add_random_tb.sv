module add_random_tb;

  // Parámetros
  logic [7:0][7:0] cell_matrix_in;
  logic [7:0][7:0] cell_matrix_out;

  // Instancia del módulo add_random
  add_random uut (
    .bomb_count(110011),
    .cell_matrix_in(cell_matrix_in),
    .cell_matrix_out(cell_matrix_out)
  );

  // Generación de una matriz de entrada inicial sin bombas
  initial begin
    cell_matrix_in = '{
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000},
      '{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000}
    };
    
    // Iniciar simulación
    $display("Matriz de entrada inicial:");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("cell_matrix_in[%0d] = %h", i, cell_matrix_in[i]);
    end
    
    // Ejecutar el módulo add_random
    $display("Agregando %0d bombas a la matriz...", "6'b110011");
    #1; // Esperar un ciclo para que el módulo add_random procese la matriz
    $display("Matriz de salida después de agregar bombas:");
    for (int i = 0; i < 8; i = i + 1) begin
      $display("cell_matrix_out[%0d] = %h", i, cell_matrix_out[i]);
    end
    
    // Terminar simulación
    $finish;
  end

endmodule

