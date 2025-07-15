module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] largest, secondLargest;

always_ff @(posedge clk) begin :DetermineSecond 
  if (~resetn) begin
    largest <= 0;
    secondLargest <= 0;
  end else if ((din > largest) && (din > secondLargest)) begin 
    largest <= din;
    secondLargest <= largest;
  end else if (din > secondLargest) begin
    secondLargest <= din;
  end
end 

assign dout = secondLargest;

endmodule
