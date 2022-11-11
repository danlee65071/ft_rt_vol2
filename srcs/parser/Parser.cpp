#include "Parser.hpp"

Parser::Parser(Parser const &copy) : _root(copy._root) {}

Parser &Parser::operator=(Parser const &source)
{
	if (this != &source)
	{
		_root = source._root;
	}
	return *this;
}

Parser::Parser() : _root(Json::Value()) {}

Parser::~Parser() {}

Json::Value Parser::parseJson(std::string filename) noexcept(false)
{
	std::ifstream ifs;
	Json::CharReaderBuilder builder;
	JSONCPP_STRING errs;

	if (filename.empty())
		throw EmptyFilenameException();
	ifs.open(filename);
	builder["collectComments"] = true;
	if (!parseFromStream(builder, ifs, &this->_root, &errs))
	{
		std::cout << errs << std::endl;
		throw Json::Exception("Can't open file");
	}
	return this->_root;
}

const char *Parser::EmptyFilenameException::what() const throw()
{
	return "Empty filename!";
}
