<?php

class SayHello
{
    public function __construct()
    {
        echo "Hello, World!";
    }
}

$hello = new SayHello();
$hello->sayHello();


$a = 1;
$b = 2;
echo $a + $b;

echo "Hello" . "World";

trait Hello
{
    public function sayHello()
    {
        echo "Hello";
    }
}

class World
{
    use Hello;

    public function sayWorld()
    {
        echo "World";
    }

    public function sayHelloWorld()
    {
        $this->sayHello();
        $this->sayWorld();
    }
}
