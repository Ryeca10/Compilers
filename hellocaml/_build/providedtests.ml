open Assert
open Hellocaml

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)
let e4 : exp = Add ( Mult(Var "y", Mult(e2, e2)), Add(Var "x", Const 1L))
let e5 : exp = Add(Const 3L, Mult(e1, e2))
let e6 : exp = Add (Const 3L, Mult ( Const 6L, Add (Var "x", Const 1L)))
let p2 = [IPushC 2L; IPushC 3L; IMul]

let provided_tests : suite = [


	  Test ("Student-Provided Tests For Problem 1-3", [
	    ("case1", assert_eqf (fun () ->  prob3_ans) 42);
	    ("case2", assert_eqf (fun () -> prob3_case2 17) 25);
	    ("case3", assert_eqf (fun () -> prob3_case3) 64);
	  ]);




	   Test ("Student-Provided Tests For Problem 4_1", [
	  		("vars_of4", assert_eqf (fun () -> vars_of e4) ["x"; "y"]);
	  ]);
	  
(*****************)

	 
	  Test ("Student-Provided Tests For Problem 4_3", [
	    ("interpret4", assert_eqf (fun () -> interpret ctxt2 e4) 66L);
	    ("interpret4", assert_eqf (fun () -> interpret ctxt2 e5) 21L);
	  ]);
	  
	
         Test ("Student-Provided Tests For Problem 5", [
	 	("compile1", assert_eqf (fun () -> compile (Add(Const 3L, Const 4L))) ([IPushC 3L; IPushC 4L; IAdd]));
	 	("compile2", assert_eqf (fun () -> compile (e2)) ( [IPushV "x"; IPushC 1L; IAdd]));
	 	("compile2", assert_eqf (fun () -> compile (e3)) ( [IPushV "y"; IPushV "x"; IPushC 1L; IAdd; IPushV "x"; 
	 		IPushC 1L; IAdd; INeg; IMul; IMul]));
	  ]);
	
	  
         Test ("Student-Provided Tests For Problem 4_4", [

        ("optimize4", assert_eqf (fun () -> optimize (e1)) (Const 6L));
	     ("optimize4", assert_eqf (fun () -> optimize (Add ( Mult(Const 3L, Mult(Const 2L, Const 2L)), Add(Const 1L, Const 1L)))) 
	     	(Const 14L));
	   
	    (*
	    	 ("optimize4", assert_eqf (fun () -> optimize (Add(Const 3L, Mult(e1, e2)))) 
	    						(Add (Const 3L, Mult ( Const 6L, Add (Var "x", Const 1L)))));

	    *)
	  ]);

]

