# @TEST-EXEC: zeek -b %INPUT >output
# @TEST-EXEC: btest-diff output

module rec_extension_test;

type Foo: record {
        a: count;
        b: count &optional;
        myset: set[count] &default=set();
};

redef record Foo += {
        c: count &default=42;
        d: string &optional;
        anotherset: set[count] &default=set();
};

global f1: Foo = [$a=21];
global f2: Foo = [$a=21, $d="XXX"];

event zeek_init()
	{
	print f1;
	print f2;
	}
