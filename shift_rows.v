module SHIFT_ROWS(
  input [127:0] IN_DATA,
  output [127:0] SHIFT_DATA
);

reg [127:0] SHIFT_DATA_REG = 128'b0;

  always @(*) begin
      // 第0行: 不变
      SHIFT_DATA_REG[127:120] = IN_DATA[127:120];  
      SHIFT_DATA_REG[119:112] = IN_DATA[87:80];
      SHIFT_DATA_REG[111:104] = IN_DATA[47:40];
      SHIFT_DATA_REG[103:96] = IN_DATA[7:0];

      // 第1行：左移1字节
      SHIFT_DATA_REG[95:88] = IN_DATA[95:88];
      SHIFT_DATA_REG[87:80] = IN_DATA[55:48];
      SHIFT_DATA_REG[79:72] = IN_DATA[15:8];
      SHIFT_DATA_REG[71:64] = IN_DATA[103:96];

      // 第2行：左移2字节
      SHIFT_DATA_REG[63:56] = IN_DATA[63:56];
      SHIFT_DATA_REG[55:48] = IN_DATA[23:16];
      SHIFT_DATA_REG[47:40] = IN_DATA[111:104];
      SHIFT_DATA_REG[39:32] = IN_DATA[71:64];

      // 第3行：左移3字节
      SHIFT_DATA_REG[31:24] = IN_DATA[31:24];
      SHIFT_DATA_REG[23:16] = IN_DATA[119:112];
      SHIFT_DATA_REG[15:8] = IN_DATA[79:72];
      SHIFT_DATA_REG[7:0] = IN_DATA[39:32]; 
    end

    assign SHIFT_DATA = SHIFT_DATA_REG;

endmodule