`timescale 1ns / 1ns
module tb_FlowingLights ();

    ////
    //\* 参数和内部信号 \//

    //wire define
    wire [2:0] led_out;

    //reg define
    reg        sys_clk;
    reg        sys_rst_n;

    //\* Main Code \//
    //初始化系统时钟、全局复位
    initial begin
        sys_clk = 1'b1;
        sys_rst_n <= 1'b0;
        #20 sys_rst_n <= 1'b1;
    end

    //sys_clk:模拟系统时钟，每10ns电平翻转一次，周期为20ns，频率为50MHz
    always #10 sys_clk = ~sys_clk;

    //\* Instantiation \//
    //-------------------- water_led_inst --------------------
    FlowingLights #(
        .CNT_MAX(25'd24)
    ) FlowingLights_inst (
        .sys_clk  (sys_clk),   //input sys_clk
        .sys_rst_n(sys_rst_n), //input sys_rst_n

        .led_out(led_out)  //output [3:0] led_out
    );

endmodule
