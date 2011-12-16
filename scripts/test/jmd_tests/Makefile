

all : test_post
	echo done

test_post :
	perl -I ../../.. -I test_config t/02_test_index_post_new_ticket.pl

test_index :
	perl -I ../../.. -I test_config t/02_test_index.pl

submit_order:
	perl -I ../../.. -I test_config t/01_submit_order.t

reload:
	perl -I ../../..1 -I test_config t/01_reload.t
