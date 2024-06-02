module KEY (
    input      clk,
    input      rst_n,
    input      k1_in,
    input      k2_in,
    input      k3_in,
    input      k4_in,
    output reg LED_R,
    output reg LED_G,
    output reg LED_B
);

    wire k1_out;
    wire k2_out;
    wire k3_out;
    wire k4_out;

    reg  k1_out_reg;
    reg  k2_out_reg;
    reg  k3_out_reg;
    reg  k4_out_reg;

    delay_soft key_delay_1 (
        .clk (clk),
        .kin (k1_in),
        .kout(k1_out)
    );

    delay_soft key_delay_2 (
        .clk (clk),
        .kin (k2_in),
        .kout(k2_out)
    );

    delay_soft key_delay_3 (
        .clk (clk),
        .kin (k3_in),
        .kout(k3_out)
    );

    delay_soft key_delay_4 (
        .clk (clk),
        .kin (k4_in),
        .kout(k4_out)
    );

    always @(posedge clk) begin
        k1_out_reg <= k1_out;
    end

    always @(posedge clk) begin
        k2_out_reg <= k2_out;
    end

    always @(posedge clk) begin
        k3_out_reg <= k3_out;
    end

    always @(posedge clk) begin
        k4_out_reg <= k4_out;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            LED_R <= 1'b0;
            LED_G <= 1'b0;
            LED_B <= 1'b0;
        end else begin
            if (k1_out_reg && !k1_out) begin
                LED_R <= ~LED_R;
            end else if (k2_out_reg && !k2_out) begin
                LED_G <= ~LED_G;
            end else if (k3_out_reg && !k3_out) begin
                LED_B <= ~LED_B;
            end else if (k4_out_reg && !k4_out) begin
                LED_R <= 1'b1;
                LED_G <= 1'b1;
                LED_B <= 1'b1;
            end else begin
                LED_R <= LED_R;
                LED_G <= LED_G;
                LED_B <= LED_B;
            end
        end
    end

endmodule
