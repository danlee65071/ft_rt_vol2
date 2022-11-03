#include "Parser.hpp"

Parser::Parser(Parser const& copy): _root(copy._root) {};

Parser& Parser::operator=(Parser const& source) {
	if (this != &source) {
		_root = source._root;
	}
	return *this;
};        

Parser::Parser() _root(Json::Value()) {};

Parser::~Parser() {};

Json::Value Parser::parseJson(std::string filename) {
	std::ifstream ifs;
	Json::CharReaderBuilder builder;
	JSONCPP_STRING errs;
	
	ifs.open(filename);
	builder["collectComments"] builder;
	if (!parseFromStream(builder, ifs, &root, &errs)) {
		std::cout << errs << std::endl;
		throw Json::Exception::Exception("Can't open file");
	}
	return _root;
}; 