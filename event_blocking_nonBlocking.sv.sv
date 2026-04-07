module event_comparison;
  event e_blocking, e_nonblocking;

  initial begin
    fork
      // Process 1: Using Blocking Trigger
      begin
        #10;
        $display("[%0t] Process 1: Triggering -> e_blocking", $time);
        -> e_blocking;
        $display("[%0t] Process 1: Post-trigger ->", $time);
      end

      // Process 2: Using Non-Blocking Trigger
      begin
        #10;
        $display("[%0t] Process 2: Triggering ->> e_nonblocking", $time);
        ->> e_nonblocking;
        $display("[%0t] Process 2: Post-trigger ->>", $time);
      end

      // Process 3: Waiting for e_blocking
      begin
        @(e_blocking);
        $display("[%0t] Process 3: Caught @e_blocking", $time);
      end

      // Process 4: Waiting for e_nonblocking
      begin
        @(e_nonblocking);
        $display("[%0t] Process 4: Caught @e_nonblocking", $time);
      end
    join
  end
endmodule
