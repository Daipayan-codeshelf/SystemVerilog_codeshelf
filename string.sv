module string_shelf;
  string s1="Hello World";
  string s2={"Hii,," , " " , s1};
  
  
  initial begin
    
    $display ("s1= %0s",s1);
    $display ("s2= %0s",s2);
  end
endmodule
