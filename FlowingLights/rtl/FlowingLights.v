module FlowingLights #(
    parameter CNT_MAX = 25'd24_999_999
) (
    input wire sys_clk,   //系统时钟50MHz
    input wire sys_rst_n, //全局复位

    output wire [2:0] led_out  //输出控制RGB 3色灯

);

    //\* Parameter and Internal Signal \//
    //寄存器定义
    reg [24:0] cnt;
    reg        cnt_flag;
    reg [ 2:0] led_out_reg;

    //\* Main Code \//
    //cnt:计数器计数500ms
    always @(posedge sys_clk or negedge sys_rst_n)
        if (sys_rst_n == 1'b0) cnt <= 25'b0;
        else if (cnt == CNT_MAX) cnt <= 25'b0;
        else cnt <= cnt + 1'b1;

    //cnt_flag:计数器计数满500ms标志信号
    always @(posedge sys_clk or negedge sys_rst_n)
        if (sys_rst_n == 1'b0) cnt_flag <= 1'b0;
        else if (cnt == CNT_MAX - 1) cnt_flag <= 1'b1;
        else cnt_flag <= 1'b0;

    //led_out_reg:led循环流水
    always @(posedge sys_clk or negedge sys_rst_n)
        if (sys_rst_n == 1'b0) led_out_reg <= 3'b001;
        else if (led_out_reg == 3'b100 && cnt_flag == 1'b1) led_out_reg <= 3'b001;
        else if (cnt_flag == 1'b1) led_out_reg <= led_out_reg << 1'b1;  //左移

    assign led_out = ~led_out_reg;

endmodule
