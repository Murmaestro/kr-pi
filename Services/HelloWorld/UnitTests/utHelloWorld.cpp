#include <gtest/gtest.h>

class TestHelloWorld : public testing::Test
{
protected:
    void SetUp() override
    {
    }
};

TEST_F(TestHelloWorld, ExpectTrue)
{
    EXPECT_TRUE(true);
}

TEST_F(TestHelloWorld, ExpectFalse)
{
    EXPECT_FALSE(false);
}
