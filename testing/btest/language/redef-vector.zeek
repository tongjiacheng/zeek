# @TEST-EXEC: zeek -b %INPUT >out
# @TEST-EXEC: btest-diff out

module redef_vec_test;

const foo: vector of string &redef;
redef foo += { "testing", "blah", "foo", "foo", "testing" };

const bar: vector of string = vector() &redef;
redef bar += { "one", "two", "three" };

const baz: vector of string = vector("a", "b", "c") &redef;
redef baz += { "one", "two", "three" };
redef baz += { "a", "b", "c" };
const d = "d";
redef baz += { "a" + "b" + "c", d };

event zeek_init()
	{
	print foo;
	print bar;
	print baz;
	}
